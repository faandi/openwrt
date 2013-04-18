# Compilation #

* get openwrt sources

  ```
  svn co svn://svn.openwrt.org/openwrt/branches/attitude_adjustment
  ```

* configure feeds

  ```
  cd attitude_adjustment
  ```  

  ```
  cp feeds.conf.default feeds.conf
  ```  

  ```
  echo "src-git faandigit https://github.com/faandi/openwrt.git" >> feeds.conf
  ```

* update feeds

  ```
  ./scripts/feeds update
  ```

* get package(s) you want

  ```
  ./scripts/feeds install te923tool
  ./scripts/feeds install mumudvb
  ```

* configure and make

  ```
  make menuconfig
  ```

  ```
  make
  ```
