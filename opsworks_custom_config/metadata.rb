maintainer "LevelSeven"
description "Writes custom yaml config files to the config directory of a Rails application."
version "0.1"

recipe "opsworks_custom_env::configure", "Write custom configuration."
recipe "opsworks_custom_env::write_config", "Write custom config files to app's deploy directory. Used by configure recipe, or can be used directly in custom situations."
