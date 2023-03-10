ARG FLAVOUR="alpine"

FROM jakzal/phpqa:${FLAVOUR}

RUN composer global bin phpcs require --dev phpcompatibility/php-compatibility
