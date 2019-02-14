lib=$(dirname $0)/../lib/
node_modules=$(dirname $0)/../node_modules

export PATH=$PATH:"$node_modules/.bin"

version=$1

echo "Building Electron Version -> $version"

node-gyp configure --target=$version --arch=x64 --dist-url=https://atom.io/download/atom-shell --module_name=node_printer --module_path=$lib
node-gyp build --target=$version --arch=x64 --dist-url=https://atom.io/download/atom-shell --module_name=node_printer --module_path=$lib
node-pre-gyp package --runtime=electron --target=$version --target_arch=x64
