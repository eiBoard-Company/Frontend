describe('Open the App', () => {
  it('Visits the Eiboard', () => {
    cy.viewport(1024, 768)
    cy.visit('http://localhost:49721/#/')
  })
})