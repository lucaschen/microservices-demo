import "@babel/polyfill";
import React from "react";
import { ApolloProvider } from "react-apollo";
import { render } from "react-dom";
import { Provider } from "react-redux";
import { createGlobalStyle, ThemeProvider } from "styled-components";

import graphqlClient from "#root/api/graphqlClient";
import Root from "#root/components/Root";
import store from "#root/store";

import * as theme from "./theme";

const GlobalStyle = createGlobalStyle`
  @import url('https://fonts.googleapis.com/css?family=Roboto:400,700&display=swap');

  html, body, #app {
    height: 100%;
    margin: 0;
    padding: 0;
    width: 100%;
  }

  body {
    font-family: Roboto, sans-serif;
  }
`;

render(
  <Provider store={store}>
    <ApolloProvider client={graphqlClient}>
      <ThemeProvider theme={theme}>
        <GlobalStyle />
        <Root />
      </ThemeProvider>
    </ApolloProvider>
  </Provider>,
  document.getElementById("app")
);
