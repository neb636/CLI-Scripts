# Pulls code from current branch after a commit through dev stage and master.

# Exit script if there is a error message
function check_conflict {
	if [ $? != "0" ];
	then echo -e "\nA error has occured";
	exit;
	fi;
}

# Get starting branch name
branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
last_branch=${branch_name##refs/heads/}
start_branch=$last_branch

# Loop through branches
for i in development staging master
do
   git checkout $i
	git pull origin $i
	check_conflict
	git merge $last_branch
	check_conflict
	git push origin $i

	last_branch=$i
done

# Go back to original branch and merge master
git checkout $start_branch
git merge master
check_conflict
