namespace :deploy do

  desc "Copies the config files, those not versioned in Git, to the server"
  task :copy_config_files do
    on roles(:all) do
      # ensures that config/ folder exists at the moment of copy
      execute "mkdir -p #{Figaro.env.target_app_path}/shared/config/"
      %w[ application.yml database.yml secrets.yml ].each do |f|
        upload! 'config/' + f , "#{Figaro.env.target_app_path}/shared/config/" + f
      end
    end
  end
end
