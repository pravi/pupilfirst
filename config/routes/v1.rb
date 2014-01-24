Svapp::Application.routes.draw do
  scope '/api' do
	  api_version(:module => "V1", :header => {:name => "Accept", :value => "application/vnd.svapp.v1"}, :defaults => {:format => "json"}, :default => true) do
	    resources :events
	    resources :news
	    resources :startups
	    resources :startup_applications
      get '/mentors' => 'info#mentors'
      get '/advisory-council' => 'info#advisory_council'
	  end
  end
end
