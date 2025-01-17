const nodemailer = require("nodemailer");

require("dotenv").config(); // Charge les variables d'environnement

// Configuration du transporteur SMTP
const transporter = nodemailer.createTransport({
  host: process.env.EMAIL_HOST,
  port: process.env.EMAIL_PORT,
  secure: false, // false pour STARTTLS
  auth: {
    user: process.env.EMAIL_USER, // Votre adresse e-mail
    pass: process.env.EMAIL_PASS, // Votre mot de passe d'application généré
  },
});

// Fonction pour tester l'envoi d'email
async function testEmail() {
  try {
    const info = await transporter.sendMail({
      from: `"Crypto Wallet" <${process.env.EMAIL_FROM}>`, // Adresse d'envoi
      to: "chaimaysf2000@gmail.com", // Adresse de test
      subject: "Test Email",
      text: "Ceci est un test d'email pour vérifier la configuration SMTP.",
      html: "<b>Ceci est un test d'email pour vérifier la configuration SMTP.</b>",
    });

    console.log("Email envoyé avec succès :", info.messageId);
  } catch (error) {
    console.error("Erreur lors de l'envoi de l'email :", error.message);
  }
}

// Exécuter la fonction
testEmail();
