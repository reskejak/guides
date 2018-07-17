# 7-17-2018
# This is an example of a working local installation method for Python 2.7 and MACS2 on the MSU HPCC (CentOS)

cd ~/bin

# get Python-2.7.14
wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz
# unpack and move into dir
gunzip Python-2.7.14.tgz
tar -xvf Python-2.7.14.tar
cd Python-2.7.14
# configure with UCS2 encoding
./configure --enable-unicode=ucs2
make
make test
./python setup.py install --prefix ~/reskejak/.local/
export PATH=$PATH:~/reskejak/.local/bin
export PYTHONPATH=~/reskejak/.local/lib/python2.7/site-packages/:$PYTHONPATH

# get pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
# install pip
./python get-pip.py --user
# install numpy via pip
 ./python -m pip install numpy --user
# install cython via pip
 ./python -m pip install Cython --user

cd ~/bin
# download macs2 source
wget https://pypi.python.org/packages/9f/99/a8ac96b357f6b0a6f559fe0f5a81bcae12b98579551620ce07c5183aee2c/MACS2-2.1.1.20160309.tar.gz
gunzip MACS2-2.1.1.20160309.tar.gz
tar -xvf MACS2-2.1.1.20160309.tar
# move into IO directory to fix bug prior to installing
cd ~/bin/MACS2-2.1.1.20160309/MACS2/IO
# edit Parser.pyx (fix 'righ_pos' to 'right_pos'; see below)
# install MACS2 with cython (re-generate .c files)
cd ~/bin/MACS2-2.1.1.20160309
~/bin/Python-2.7.14/python setup_w_cython.py install --prefix ~/reskejak/.local/

# MACS2 usage
~/bin/Python-2.7.14/python ~/.local/bin/macs2

# final notes: MACS2 cannot be properly installed through pip because it is pre-compiled and thus cannot fix Parser.pyx bug
# see: https://github.com/taoliu/MACS/commit/1b5f37a5c93102eede9112bd1b6eed2a53b6da74#diff-8c959df4592483625e87e433583a9ed1
# if other issues are presented, try using full paths in commands (i.e. manual tilde-expansion)
