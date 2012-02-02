# Thumbnailer

## Description

After messing around with [CarrierWave](https://github.com/jnicklas/carrierwave) using [Rackspace CloudFiles](http://www.rackspace.com/cloud/cloud_hosting_products/files/) for storage, I toyed around with the idea of deferring image processing and transfer to speed things up for the user using something like [carrierwave_backgrounder](https://github.com/lardawge/carrierwave_backgrounder). 

However, this solution would prevent users from seeing any thumbnails once their are done uploading, which is where something like this could help, serving a thumbnail or two to the user while processing and uploading takes place.

Inspired by

- https://github.com/xxx/fakeimage
- http://placehold.it
- http://dummyimage.com

## Requirements

Thumbnailer handles routing with [Sinatra](https://github.com/sinatra/sinatra), IO operations with [kgio](http://bogomips.org/kgio/) and image processing with [GraphicsMagick](http://www.graphicsmagick.org/).

## Installation

```
  # Mac OS X
  brew install graphicsmagick
  
  # Debian/Ubuntu
  apt-get install graphicsmagick
  
  # Setup
  git clone git@github.com:dcornu/Thumbnailer.git
  cd Thumbnailer
  gem install bundler
  bundle install
  bundle exec ruby app.rb
```

Place any images you would like to serve in /images.

You can now access them from `http://localhost:4567/image.jpg`.

You can specify the size you would like by passing `width` and `height` as params: `http://localhost:4567/image.jpg?width=200&height=200`.

