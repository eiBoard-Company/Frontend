
describe('Flutter-Seitentest', () => {
  beforeEach(() => {
    // Starten Sie Ihre Flutter-App mit Flutter Driver
    cy.viewport(1024, 768)
    cy.visit('http://localhost:49721/#/')
  })

  it('klickt auf den Login-Button', () => {
    // Navigieren Sie zur Seite
    cy.flutter('route', '/login')

    // Warten Sie auf die Flutter-UI
    cy.flutter('waitFor', 'finder', 'loginButton', { timeout: 5000 })

    // Den Login-Button finden und darauf klicken
    cy.flutter('tap', 'finder', 'loginButton')

    // Fügen Sie hier weitere Überprüfungen
  })})