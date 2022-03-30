.PHONY : docs
docs :
	rm -rf docs/build/
	sphinx-autobuild -b html --watch test_package/ docs/source/ docs/build/

.PHONY : run-checks
run-checks :
	isort --check .
	black --check .
	flake8 .
	mypy .
	CUDA_VISIBLE_DEVICES='' pytest -v --color=yes --doctest-modules tests/ test_package/
