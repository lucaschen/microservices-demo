import ListingsService from "#root/adapters/ListingsService";

const listingsResolver = async () => {
  return await ListingsService.fetchAllListings();
};

export default listingsResolver;
