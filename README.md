# Static Analysis Tools for PHP

Source image https://github.com/jakzal/phpqa

The image contains https://github.com/PHPCompatibility/PHPCompatibility set of sniffs for https://github.com/squizlabs/PHP_CodeSniffer


## Available commands

    make help
  
## Build image

    make build-alpine
  
## Add alias

    alias phpqa='docker run --init -it --rm -v "$(pwd):/project" -w /project tybetx/phpqa-phpcs-phpcompatibility:alpine'

## Usage

    phpqa phpcs --standard=PHPCompatibility --runtime-set testVersion 8.1 .
