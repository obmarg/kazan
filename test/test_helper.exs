ExUnit.start()
ExUnit.configure(capture_log: true, exclude: [:integration])
Application.ensure_all_started(:bypass)
