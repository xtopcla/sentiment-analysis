import uvicorn

from app.config import Settings


def main() -> None:
    settings = Settings()
    uvicorn.run("app.main:app", reload=settings.debug)


if __name__ == "__main__":
    main()
