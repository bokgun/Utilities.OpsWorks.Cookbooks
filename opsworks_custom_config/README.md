opsworks\_custom\_config
========================

This cookbook provides a way for Rails applications to serve custom
configuration files on Amazon Opsworks. The filename and configuration are
loaded from the Stack Settings JSON collection.

To use store your custom config values in the stack settings JSON collection.
Example:

    {
      "custom_config": {
        "my_app": {
          "config_file_name_no_extension": {
            "FOO": "http://www.yahoo.com",
            "BAR": "1001"
          },
          "config_file_2_name_no_extension": {
            "BAZ": "http://www.google.com",
            "QUX": "5000"
          }
        }
      },
      
      "deploy": {
        "my_app": {
          "symlink_before_migrate": {
            "config/config1.yml": "config/config1.yml",
            "config/config2.yml": "config/config2.yml"
          }
        }
      }
    }

Opsworks Set-Up
---------------

* Add `custom_config` and `symlink_before_migrate` attributes to the
  stack's custom JSON as in the example above.
* Associate the `opsworks_custom_config::configure` custom recipe with the _Deploy_
  event in your rails app's layer.


If you want to run this without actually deploying the application (through
opsworks run command feature for example) then you must specify custom JSON and
include the rails environment you are deploying to. Example:

    {
      "custom_config": {
        "my_app": {
          "config_file_name_no_extension": {
            "FOO": "http://www.yahoo.com",
            "BAR": "1001"
          },
          "config_file_2_name_no_extension": {
            "BAZ": "http://www.google.com",
            "QUX": "5000"
          }
        }
      },
      
      "deploy": {
        "my_app": {
          "symlink_before_migrate": {
            "config/config1.yml": "config/config1.yml",
            "config/config2.yml": "config/config2.yml"
          },
          "rails_env" : "production"
        }
      }
    }
    {
      "custom_config": {
        "my_app": {
          "config_file_name_no_extension": {
            "FOO": "http://www.yahoo.com",
            "BAR": "1001"
          },
          "config_file_2_name_no_extension": {
            "BAZ": "http://www.google.com",
            "QUX": "5000"
          }
        }
      },
      
      "deploy": {
        "my_app": {
          "symlink_before_migrate": {
            "config/config1.yml": "config/config1.yml",
            "config/config2.yml": "config/config2.yml"
          }
        }
      }
    }



Credits
---------------
Thanks to https://github.com/joeyAghion/opsworks_custom_env for providing
a reference point for this recipe.
