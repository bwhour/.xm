source ~/.newbashrc
export gover=go1.14.2
export code=/opt/code/mygo
export GOROOT=/usr/local/go/$gover
export GOPATH=$code
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GOPATH
