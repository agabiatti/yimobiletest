# README
## Yi Mobile Test API

**Clone the repository:**  
```shell
$ git clone git@github.com:agabiatti/yimobiletest.git
$ cd yimobiletest
```
### Development  

#### Local install  
The API requires [Ruby 2.5.3](https://www.ruby-lang.org/pt/), [Rails 5.2.2](https://rubyonrails.org/) and [MySQL](https://www.mysql.com/)  
```shell
$ \curl -sSL https://get.rvm.io | bash
$ rvm install ruby-2.5.3
$ gem install rails
$ bundle install
$ rake db:migrate
```
**Ready!**  
Run the server with `$ rails server` and load localhost:8000 in your favorite browser.

## API Endpoint

**User:**  
  * `/api/user/` List all users.  
  * `/api/user/:id` Show details for user specified in _ID_ url parameter.  

**Event:**  
  * `/api/v1/event` List all events.  
  * `/api/v1/event/:id` Show details for event specified in _ID_ url parameter.  

**Comment:**  
  * `/api/v1/comment`  List all comments.  
  * `/api/v1/comment/:id`  Show details for comment specified in _ID_ url parameter.  
  * `/api/v1/reported_comments`  Show details for reported comments.
  * `/api/v1/without_comment_reported`  Show details for comment without reported.

**Report:**  
  * `/api/v1/report` List all reports.  
  * `/api/v1/report/:id` Show details for report specified in _ID_ url parameter.  