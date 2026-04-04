#Stock Price Trcaker

## Overview

Stock Price Tracker is a real time iOS application that display live stock price updates for multiple symbol using WebSocket communication.

The app is designed using modern iOS architecture patterns to ensure scalability, testability and real time performance.

## Features

- Display 25 stock symbols with : 
  - Symbol name
  - Current price
  - Price change indicator
  
- Real time price updates using WebSocket

- Sorting options: 
 - By Price
 - By Price Change
 
- Symbol Detail Screen :
 
 - Live Price updates
 - Price change indicator
 - Description
 
- Connection status indicator (Connected/Disconnected)
- Start/Stop price feed
- Read - time updates synchornized across screens

## Architecture

This project follow a scalable and clean architecture: 

## MVVM (Model-View-ViewModel)
- Separates UI from business logic

### Repository Pattern
- Acts as a single source of truth
- Manages stock updates and data flow

### Dependency Injection
- Uses protocol-based design 
- Improves flexibility and testability 


### Combine 

- Handles real time data updates
- Automatically updates UI


 

