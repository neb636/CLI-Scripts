# Script to grab and download the latest version of WordPress and extract it
# to the current directory.

echo "Is this a VIP install?";
read vip
echo "What should the Wordpress install be named?";
read name

if [ "$vip" = "yes" ] || [ "$vip" = "y" ]; then
	svn checkout http://core.svn.wordpress.org/trunk/ $name
	cd $name/wp-content/themes/vip/
	svn co https://vip-svn.wordpress.com/plugins/ plugins
else
	curl -o wordpress.tar.gz 'http://wordpress.org/latest.tar.gz'
	tar -xvf wordpress.tar.gz
	mv wordpress $name
	rm wordpress.tar.gz
	cd $name
fi