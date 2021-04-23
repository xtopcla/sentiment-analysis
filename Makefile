VENV:=venv
VENV_PROD:=$(VENV)/.prod
VENV_DEV:=$(VENV)/.dev


$(VENV_PROD):
	python -m venv $(VENV)
	$(VENV)/bin/pip install -r requirements.txt
	touch $(VENV_PROD)

$(VENV_DEV): $(VENV_PROD)
	$(VENV)/bin/pip install -r requirements-dev.txt
	touch $(VENV_DEV)


.PHONY: format
format: $(VENV_DEV)
	$(VENV)/bin/isort src
	$(VENV)/bin/black --verbose src


.PHONY: run/devserver
run/devserver: $(VENV_PROD)
	PYTHONPATH=./src DEBUG=true $(VENV)/bin/python -m app

.PHONY: run/server
run/server: $(VENV_PROD)
	PYTHONPATH=./src DEBUG=false $(VENV)/bin/python -m app
