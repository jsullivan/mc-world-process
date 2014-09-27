echo "Hello world!"
incoming_path=$HOME/minecraft
world=Aincrad

# Uncompress tarball
echo "====================================="
echo "Uncompressing tarball on remote..."
echo "====================================="
cd $incoming_path
tar -xvf $world.tar
echo "====================================="
echo "DONE!"
echo "====================================="

# Move dir to mapcrafter directory
printf "Moving world tmapcrafter directory..."
mv $world /var/www/mc.dipperstove.com/worlds/aincrad/
echo "done!"

# Symlink current to the new world save
printf "Symlinking..."
cd /var/www/mc.dipperstove.com/worlds/aincrad
rm current
ln -s Aincrad current
echo "done!"

# Render maps
echo "====================================="
printf "Rendering maps..."
echo "====================================="

cd /var/www/mc.dipperstove.com
mapcrafter -c render.conf

echo "====================================="
printf "DONE!"
echo "====================================="
