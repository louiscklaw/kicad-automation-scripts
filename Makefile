
build_kicad_automation_scripts:
	docker build -t logickee/kicad-automation-scripts .

push_kicad_automation_scripts: build_kicad_automation_scripts
	docker push logickee/kicad-automation-scripts

build_docker_kicad:
	docker build -t logickee/kicad:latest Dockerfile.kicad

push_docker_kicad: build_docker_kicad
	docker push logickee/kicad

test_image: build_docker_kicad build_kicad_automation_scripts
	sh scripts/build.sh

push_all: push_docker_kicad push_kicad_automation_scripts

all: push_all
