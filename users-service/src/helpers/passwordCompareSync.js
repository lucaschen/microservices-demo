import bcrypt from "bcryptjs";

const passwordCompareSync = (passwordToTest, passwordHash) => bcrypt.compareSync(passwordToTest, passwordHash);

export default passwordCompareSync;
