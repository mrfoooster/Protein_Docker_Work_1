#!/bin/bash


usage() {
	cat <<EOF
	Usage: docker <[options]>
	Options:
		 -m	 --mode              Select mode <build|deploy|template> 
		 -n	 --image-name        Docker image name
		 -t	 --image-tag         Docker image tag
		 -M 	 --memory            Container memory limit
		 -c  	 --cpu               Container cpu limit
		 -C  	 --container-name    Container name
		 -R  	 --registery         DocherHub or GitLab Image registery
		 -a  	 --application-name  Run mysql or mongo server

EOF
}

while getopts ':m:n:t:M:c:C:R:a'; do
	case $1 in
		"-m" | "--mode") 
			function build(){
				docker build
			}

			function deploy(){
				docker run
			}

			;;

		"-n" | "--image-name")
			function name(){
				docker build -f $1
				shift
			}
			
			;;
		"-t" | "--image-tag")
			function tag(){
				docker build -f $1
				shift
			}
			
			;;
		"-M" | "--memory")
			function memory(){
				read "$1"
				if [ -z $1 ]; then
					ulimit -s unlimited
				fi
				shift
			}

			;;
		"-c" | "--cpu")
			function cpu(){
				read "$1"
				if [ -z $1 ]; then
					cpulimit -l $1
				fi
				shift
			}

			;;
		"-R" | "--registery")

		
	
