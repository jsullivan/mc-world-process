incoming_path=$HOME/minecraft
world=$(ls -t Aincrad* | head -1)

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
printf "Moving world to mapcrafter directory..."
mv $world /var/www/mc.dipperstove.com/worlds/aincrad/
echo "done!"

# Cleanup incoming directory
printf "Cleaning incoming directory..."
rm -rf $world
rm $world.tar
echo "Done!"

# Symlink current to the new world save
printf "Symlinking..."
cd /var/www/mc.dipperstove.com/worlds/aincrad
rm current
ln -s $world current
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
