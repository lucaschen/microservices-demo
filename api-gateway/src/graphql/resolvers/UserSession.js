import UsersService from "#root/adapters/UsersService";

const UserSession = {
  user: async userSession => {
    return await UsersService.fetchUser({ userId: userSession.userId });
  }
};

export default UserSession;
