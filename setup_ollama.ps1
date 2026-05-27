$ollama = "$env:LOCALAPPDATA\Programs\Ollama\ollama.exe"
if (-not (Test-Path $ollama)) {
    Write-Error "Ollama not found at $ollama. Please make sure Ollama is installed."
    exit 1
}

Write-Host "Pulling qwen2.5:1.5b..."
& $ollama pull qwen2.5:1.5b

Write-Host "Pulling llama3.2:latest..."
& $ollama pull llama3.2:latest

Write-Host "Pulling gemma3:1b..."
& $ollama pull gemma3:1b

Write-Host "Removing old custom models if they exist..."
try { & $ollama rm pdf-qwen } catch {}
try { & $ollama rm pdf-llama } catch {}
try { & $ollama rm pdf-gemma } catch {}

Write-Host "Creating custom pdf-qwen model..."
& $ollama create pdf-qwen -f Modelfile-qwen

Write-Host "Creating custom pdf-llama model..."
& $ollama create pdf-llama -f Modelfile-llama

Write-Host "Creating custom pdf-gemma model..."
& $ollama create pdf-gemma -f Modelfile-gemma

Write-Host "Ollama models setup complete!"
