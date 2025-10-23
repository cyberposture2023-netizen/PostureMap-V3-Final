function renderUI(role) {
  const tabs = document.querySelectorAll('.tab')
  tabs.forEach(tab => {
    if (tab.dataset.role.includes(role)) {
      tab.style.display = 'block'
    } else {
      tab.style.display = 'none'
    }
  })
}
