Rails.application.routes.draw do
  get("/", { :controller => "places", :action => "home" })
  get("/login", { :controller => "sessions", :action => "new" })
  get("/logout", { :controller => "sessions", :action => "destroy" })
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
end
