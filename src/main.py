import sqlite3
from pathlib import Path


BASE_DIR = Path(__file__).resolve().parent.parent

DB_PATH = BASE_DIR / "data" / "TechStore.db"
QUERIES_DIR = BASE_DIR / "sql" / "queries"


def executar_query(cursor, arquivo_query):
    """
    Lê um arquivo SQL, executa a query
    e imprime os resultados no terminal.
    """

    print("\n" + "=" * 60)
    print(f"QUERY: {arquivo_query.name}")
    print("=" * 60)

    try:

        with open(arquivo_query, "r", encoding="utf-8") as arquivo:
            sql = arquivo.read()

        cursor.execute(sql)

        resultados = cursor.fetchall()

        colunas = [descricao[0] for descricao in cursor.description]

        print(" | ".join(colunas))
        print("-" * 60)

        for linha in resultados:
            print(" | ".join(str(valor) for valor in linha))

        if not resultados:
            print("Nenhum resultado encontrado.")

    except sqlite3.Error as erro:
        print(f"Erro ao executar {arquivo_query.name}:")
        print(erro)


def main():

    print("\nINICIANDO ANÁLISE DE VENDAS...\n")

    if not DB_PATH.exists():
        print("ERRO: Banco de dados não encontrado.")
        print(f"Esperado em: {DB_PATH}")
        print("\nExecute primeiro o arquivo database.py")
        return

    if not QUERIES_DIR.exists():
        print("ERRO: Pasta de queries não encontrada.")
        print(f"Esperado em: {QUERIES_DIR}")
        return

    try:
        with sqlite3.connect(DB_PATH) as conexao:

            cursor = conexao.cursor()

            arquivos_queries = sorted(
                QUERIES_DIR.glob("*.sql")
            )

            if not arquivos_queries:
                print("Nenhum arquivo SQL encontrado.")
                return
            
            for arquivo_query in arquivos_queries:
                executar_query(cursor, arquivo_query)

    except sqlite3.Error as erro:
        print("Erro ao conectar ao banco de dados:")
        print(erro)

    print("\n" + "=" * 60)
    print("ANÁLISE FINALIZADA!")
    print("=" * 60)


if __name__ == "__main__":
    main()