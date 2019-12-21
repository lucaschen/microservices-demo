import { ApolloServer } from "apollo-server-express";
import cookieParser from "cookie-parser";
import cors from "cors";
import express from "express";

import resolvers from "#root/graphql/resolvers";
import typeDefs from "#root/graphql/typeDefs";
import accessEnv from "#root/helpers/accessEnv";

import formatGraphQLErrors from "./formatGraphQLErrors";
import injectSession from "./injectSession";

const PORT = accessEnv("PORT", 7000);

const apolloServer = new ApolloServer({
  context: a => a,
  formatError: formatGraphQLErrors,
  resolvers,
  typeDefs
});

const app = express();

app.use(cookieParser());

app.use(
  cors({
    origin: (origin, cb) => cb(null, true),
    credentials: true
  })
);

app.use(injectSession);

apolloServer.applyMiddleware({ app, cors: false, path: "/graphql" });

app.listen(PORT, "0.0.0.0", () => {
  console.info(`API gateway listening on ${PORT}`);
});
