const CURRENT_USER = 'active-user';
const SELECTED_USER = 'selected-user';

//TODO: use vuex
export class Storage {
  static isOwnershipAccount() {
    const currentUser = this.getCurrentUser();
    const selectedUser = this.getSelectedUser();

    return (currentUser && currentUser.id) == (selectedUser && selectedUser.id)
  }

  static isLoggedIn() {
    const currentUser = this.getCurrentUser();
    const selectedUser = this.getSelectedUser();

    return currentUser && !!currentUser.id
  }

  static setCurrentUser(user) {
    localStorage.setItem(CURRENT_USER, JSON.stringify(user));
  }

  static getCurrentUser() {
    const user = localStorage.getItem(CURRENT_USER);
    return JSON.parse(user);
  }

  static setSelectedUser(user) {
    localStorage.setItem(SELECTED_USER, JSON.stringify(user));
  }

  static getSelectedUser() {
    const user = localStorage.getItem(SELECTED_USER);
    return JSON.parse(user);
  }
}
