# Minimal Heroku unicorn config
# Heroku has a 5s timeout so we enforce the same
# Depending on memory usage workers can be bumped to 3-4
worker_processes 2
timeout 5
