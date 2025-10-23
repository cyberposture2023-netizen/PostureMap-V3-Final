document.addEventListener('DOMContentLoaded', () => {
  const tabs = document.querySelectorAll('.tab')
  tabs.forEach(tab => {
    tab.addEventListener('click', () => {
      document.querySelectorAll('.tab-content').forEach(c => c.style.display = 'none')
      document.getElementById(tab.dataset.target).style.display = 'block'
    })
  })
})
