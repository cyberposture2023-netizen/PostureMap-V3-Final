function renderAIOutput() {
  fetch('ai-review-engine/response.json')
    .then(res => res.json())
    .then(data => {
      document.getElementById('ai-score').innerText = data.Score
      document.getElementById('ai-summary').innerText = data.Summary
      document.getElementById('ai-recommendation').innerText = data.Recommendation
    })
}
