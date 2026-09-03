import sqlite3
from pathlib import Path


# ============================================================
# CAMINHOS DO PROJETO
# ============================================================

BASE_DIR = Path(__file__).resolve().parent.parent

DB_PATH = BASE_DIR / "data" / "TechStore.db"

DDL_PATH = BASE_DIR / "sql" / "ddl" / "create_tables.sql"

DML_PATH = BASE_DIR / "sql" / "dml" / "insert_data.sql"


# ============================================================
# CRIAR E INICIALIZAR BANCO
# ============================================================

def criar_banco():

    print("\nINICIANDO CRIAÇÃO DO BANCO...\n")

    # Cria a pasta data caso ela não exista
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)

    # Remove o banco antigo, caso exista
    if DB_PATH.exists():
        DB_PATH.unlink()
        print("Banco antigo removido.")

    try:
        # Conecta ao banco (isso cria o arquivo .db)
        with sqlite3.connect(DB_PATH) as conexao:

            print(f"Banco criado em:\n{DB_PATH}\n")

            # Ativa as chaves estrangeiras
            conexao.execute("PRAGMA foreign_keys = ON;")

            # =================================================
            # CRIAR TABELAS
            # =================================================

            print("Criando tabelas...")

            with open(DDL_PATH, "r", encoding="utf-8") as arquivo:
                conexao.executescript(arquivo.read())

            print("Tabelas criadas com sucesso!")

            # =================================================
            # INSERIR DADOS
            # =================================================

            print("Inserindo dados...")

            with open(DML_PATH, "r", encoding="utf-8") as arquivo:
                conexao.executescript(arquivo.read())

            print("Dados inseridos com sucesso!")

        print("\nBANCO INICIALIZADO COM SUCESSO!")

    except FileNotFoundError as erro:

        print("\nERRO: Arquivo SQL não encontrado!")
        print(erro)

    except sqlite3.Error as erro:

        print("\nERRO NO SQLITE!")
        print(erro)


# ============================================================
# EXECUÇÃO
# ============================================================

if __name__ == "__main__":
    criar_banco()