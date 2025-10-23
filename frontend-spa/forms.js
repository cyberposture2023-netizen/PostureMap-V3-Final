function buildForm(fields) {
  const form = document.createElement('form')
  fields.forEach(f => {
    const input = document.createElement('input')
    input.name = f.name
    input.placeholder = f.label
    form.appendChild(input)
  })
  document.body.appendChild(form)
}
