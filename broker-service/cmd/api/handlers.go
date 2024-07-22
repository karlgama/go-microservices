package main

import (
	"net/http"
)

func (app *Config) Broker(w http.ResponseWriter, request *http.Request) {

	payload := jsonResponse{
		Error:   false,
		Message: "Hit the broker",
	}

	_ = app.writeJSON(w, http.StatusOK, payload)

}
