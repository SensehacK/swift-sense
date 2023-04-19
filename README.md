# swift-sense

This package will help you eliminate boilerplate code and would add extension convenience to your project whenever needed.

## Description

After writing the same Network code in every project, I noticed that what if I can just freeze certain part of the code which I always rely on for basic tasks like making a network requests and parsing the data value into a `Result` type.  This gave me the inspiration to create this small package as a way to add dependency to any project which makes everyday task a little bit easier.






## Features


- Generic Network
    This has been added so far in `Webservice.swift` which takes care of basic error handling and making network requests.

- Swift Combine Network 
    This is available for iOS 13+ using Swift Combine framework option.
    
    


## Planned Features

- Image Network Async

- Generic Network Async Await
    Next focus

- Apple Hero Button


## Usage

Respective functions of the singleton class has appropriate documentation with their code usage in `Developer Documentation`.


## Add Package

### SPM

Add this package to Xcode using Swift Package Manager (SPM).

Open existing Xcode project. Select `File` -> `Add Package`.
Enter this repository URL `https://github.com/SensehacK/swift-sense`
Select the latest build or select `Upto Major Version`. This repository would be supporting `semantic versioning`.

After the package has been added. Import it in your file using 
`import swift_sense`


## Update Package

### SPM
Open existing Xcode project. Select `File` -> `Packages` -> `Update to latest Package versions`
It should check the default rules regaring package update rules and proceed with it appropriately.


## DocC Generation

```bash
swift package --allow-writing-to-directory ./docs \
    generate-documentation --target swift-sense \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path swift-sense \
    --output-path ./docs

```

## Authored

- [Kautilya Save](https://www.linkedin.com/in/kautilyasave/)
