String getAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'Adresse courriel invalide.';
    case 'wrong-password':
      return 'Mot de passe incorrect.';
    case 'user-disabled':
      return 'Ce compte a été désactivé.';
    case 'user-not-found':
      return 'Aucun utilisateur trouvé avec cet email.';
    case 'email-already-in-use':
      return 'Cette adresse est déjà utilisée.';
    case 'operation-not-allowed':
      return 'Connexion non autorisée.';
    case 'weak-password':
      return 'Mot de passe trop faible (au moins 6 caractères).';
    default:
      return 'Une erreur est survenue. Veuillez réessayer.';
  }
}
