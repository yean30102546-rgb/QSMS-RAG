$ollama = "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
Write-Host "Retrying pulling gemma3:1b..."
& $ollama pull gemma3:1b

Write-Host "Creating custom pdf-gemma model..."
try { & $ollama rm pdf-gemma } catch {}
& $ollama create pdf-gemma -f Modelfile-gemma

Write-Host "Gemma model setup complete!"
