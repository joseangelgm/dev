export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"

plugins=(
  #git,
  wd
)

source $ZSH/oh-my-zsh.sh

# Personal exports
export EDITOR=/usr/bin/vim
export SUDO_EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/chromium

# export cargo for rust
export PATH=$HOME/.cargo/bin:$PATH

export PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export PATH=$JAVA_HOME/bin:$PATH

# ANDROID SDK
export PATH=$HOME/Android/Sdk/tools/bin:$PATH
export PATH=$HOME/Android/Sdk/emulator:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH

# SPARK
export SPARK_HOME=$HOME/Documents/MasterIOT/Asignaturas/TDM/4-Spark/spark-3.0.1-bin-hadoop2.7
export PATH=$SPARK_HOME/bin:$PATH

export BASH=/usr/bin/bash
###################
