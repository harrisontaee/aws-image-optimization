#!/usr/bin/env node
import "source-map-support/register";
import * as cdk from "aws-cdk-lib";
import { ImageOptimizationStack } from "../lib/image-optimization-stack";

if (!process.env.STACK_NAME || !process.env.BUCKET_NAME)
	throw new Error("STACK_NAME and BUCKET_NAME must be set");

const app = new cdk.App();
new ImageOptimizationStack(
	app,
	process.env.STACK_NAME,
	process.env.BUCKET_NAME,
);
