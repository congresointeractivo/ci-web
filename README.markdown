# Congreso Interactivo Web

Utiliza el dump de monitor ciudadano: ~/data/monitor_ciudadano_dump.sql

## Requisitos

    MySQL (>= 5.1.39)
    Rails 3.0.9
    Ruby 1.9.2-p0

## Instalación

### Para Desarrollo

    git clone git@github.com:etagwerker/ci-web.git
    cd ci-web
    cp config/database.yml.sample config/database.yml
    gem install bundler --no-ri --no-rdoc
    bundle install
    rake db:create:all
    mysql --database=ci_development < data/monitor_ciudadano_dump.sql
    rake db:migrate
    rails server

Nota: Vas a tener que revisar config/database.yml para que use tu usr/pwd de MySQL

### Para Tests

Para correr los tests.

    mysql --user=tu_usuario_de_mysql -p --database=ci_test < data/monitor_ciudadano_dump.sql
    rake

Para hacer los tests usamos directamente el dump de Monitor Ciudadano.

### Para producción

Para configurar la notificación por mail de excepciones se puede modificar el archivo de configuración
config/environment/production.rb

Para configurar el SMTP se debe crear el archivo conf/initializer/setup_mail.rb con lo siguiente:

    ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "gmail.com",
      :user_name            => ENV['SMTP_USER_NAME'],
      :password             => ENV['SMTP_PASSWORD'],
      :authentication       => "plain",
      :enable_starttls_auto => true
    }

### Despliegue en Heroku (Producción)

#### Configuración del SMTP (para el envío de mails)

```
heroku config:set SMTP_USER_NAME='errors.congresointeractivo' 
heroku config:set SMTP_PASSWORD='password'
```

#### Base de datos externa

Se configuró una base de datos mysql en el hosting Neolo.com
Para poder utilizarla desde heroku se debe ejecutar en la terminal lo siguiente:

``` 
heroku config:set DATABASE_URL="mysql2://usuario:password@www.congresointeractivo.org/congreso_interactivo?reconnect=true"

```

donde se debe utilizar el usuario y password creado en el hosting.  
Para que el servidor mysql permita el acceso desde heroku se debe dar permiso al host: %.amazonaws.com

#### Conversión a PostgreSQL

El script (dump sql) puede ser convertido a postgres (utilizando la gema [mysql2postgres](https://github.com/maxlapshin/mysql2postgres)). 
Existe un conveniente con el nombre de las tablas lo que impide, sin un realizar varios cambios en el proyecto, utilizar la aplicación con Postgres.  El inconveniente reside en que las tablas (en el script) son creadas en mayúsculas y postgres falla al realizar las consultas, ya que normaliza todos los identificadores (nombres de tablas, columnas, etc) a minúsculas (http://www.postgresql.org/docs/current/static/sql-syntax-lexical.html#SQL-SYNTAX-IDENTIFIERS)  

## Contribuciones

* Cualquier contribución es bienvenida
* Fork the project
* Make your feature addition or bug fix
* Add tests for it. This is important so I don't break it in a
  future version unintentionally
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but
   bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches

## License

(The MIT License)

Copyright (c) 2011 Ernesto Tagwerker <ernesto@etagwerker.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

