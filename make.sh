if [ -z "$1" ]; then
	echo "No argument! Give project a name"
fi

is_successful() {
	if [ $? == 0 ]; then
		echo "Success!"
	else
		echo "Failure:"
		echo $?
	fi
}

mkdir $1
cp templates/.gitignore templates/.gitattributes templates/setup.py $1
cd $1
echo "Creating virtualenv..."
python3 -m venv env > /dev/null
is_successful
echo "Initializing Git repo..."
git init > /dev/null
is_successful
git add .gitignore .gitattributes
echo "Added .gitignore to Git"
echo "# ${1}" > README.md
git add README.md
mkdir src
touch src/__init__.py
echo "def main():" > src/__main__.py
echo "Now activate the venv and start coding!"
