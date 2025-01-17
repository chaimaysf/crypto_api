import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import API from "../services/api"; // Assure-toi que ce fichier est correctement configuré

const Register = () => {
  const navigate = useNavigate();

  // Gestion des données du formulaire
  const [formData, setFormData] = useState({
    name: "", // Ajout du champ "name" ici
    email: "",
    password: "",
    confirmPassword: "",
  });

  const [errors, setErrors] = useState<string | null>(null); // Gestion des erreurs

  // Mise à jour des données du formulaire lors des modifications
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
  };

  // Gestion de la soumission du formulaire
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    // Validation côté client : vérifier si les mots de passe correspondent
    if (formData.password !== formData.confirmPassword) {
      setErrors("Les mots de passe ne correspondent pas.");
      return;
    }

    try {
      const { name, email, password } = formData; // Inclure "name" dans les données envoyées

      // Appel à l'API backend pour l'enregistrement
      await API.post("/auth/register", { name, email, password });

      // Rediriger l'utilisateur vers la page de connexion après un succès
      navigate("/login");
    } catch (error: any) {
      // Gestion des erreurs renvoyées par l'API
      setErrors(
        error.response?.data?.message || "Échec de l'inscription. Veuillez réessayer."
      );
    }
  };

  return (
    <div className="max-w-md mx-auto p-4 space-y-6">
      <h1 className="text-2xl font-bold text-center">Inscription</h1>

      {/* Affichage des erreurs */}
      {errors && <div className="text-red-500">{errors}</div>}

      <form onSubmit={handleSubmit} className="space-y-4">
        {/* Champ Name */}
        <div>
          <label htmlFor="name" className="block font-medium mb-1">
            Nom
          </label>
          <input
            type="text"
            id="name"
            name="name" // Correspond à la clé "name" dans formData
            value={formData.name}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
            placeholder="Entrez votre nom"
          />
        </div>

        {/* Champ Email */}
        <div>
          <label htmlFor="email" className="block font-medium mb-1">
            Email
          </label>
          <input
            type="email"
            id="email"
            name="email" // Correspond à la clé "email" dans formData
            value={formData.email}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
            placeholder="exemple@email.com"
          />
        </div>

        {/* Champ Password */}
        <div>
          <label htmlFor="password" className="block font-medium mb-1">
            Mot de passe
          </label>
          <input
            type="password"
            id="password"
            name="password" // Correspond à la clé "password" dans formData
            value={formData.password}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
            placeholder="Entrez votre mot de passe"
          />
        </div>

        {/* Champ Confirm Password */}
        <div>
          <label htmlFor="confirmPassword" className="block font-medium mb-1">
            Confirmez le mot de passe
          </label>
          <input
            type="password"
            id="confirmPassword"
            name="confirmPassword" // Correspond à la clé "confirmPassword" dans formData
            value={formData.confirmPassword}
            onChange={handleChange}
            required
            className="w-full p-2 border rounded"
            placeholder="Confirmez votre mot de passe"
          />
        </div>

        {/* Bouton Submit */}
        <button
          type="submit"
          className="w-full bg-blue-500 text-white py-2 rounded hover:bg-blue-600"
        >
          S'inscrire
        </button>
      </form>
    </div>
  );
};

export default Register;
