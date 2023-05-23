import express from "express";
import cron from 'node-cron'
import ImportProducts from "./routes";

console.log('Inicializando cron')

ImportProducts();

const getData = async () => {
 ImportProducts()
};

const jobFrequency = "*/1 * * * *";

cron.schedule(jobFrequency, getData);

