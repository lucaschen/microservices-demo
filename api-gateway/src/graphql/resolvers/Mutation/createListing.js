import ListingsService from "#root/adapters/ListingsService";

const createListingResolver = async (obj, { description, title }, context) => {
  if (!context.res.locals.userSession) throw new Error("Not logged in!");
  return await ListingsService.createListing({ description, title });
};

export default createListingResolver;
