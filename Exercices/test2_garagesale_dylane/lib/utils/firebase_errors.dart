String getFirebaseAuthErrorMessage(String errorCode) {
  switch (errorCode) {
    case 'invalid-email':
      return 'L\'adresse courriel est invalide.';
    case 'user-disabled':
      return 'Ce compte a été désactivé.';
    case 'user-not-found':
      return 'Aucun utilisateur trouvé avec cet email.';
    case 'wrong-password':
      return 'Mot de passe incorrect.';
    case 'email-already-in-use':
      return 'Cette adresse est déjà utilisée.';
    case 'operation-not-allowed':
      return 'Opération non autorisée.';
    case 'weak-password':
      return 'Mot de passe trop faible.';
    default:
      return 'Une erreur est survenue. Veuillez réessayer.';
  }
}
