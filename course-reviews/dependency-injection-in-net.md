# Dependency Injection in .NET

Here are some noteworthy takeaways from a course on Dependency Injection in .NET Core.

Services are registered at start up, and resolve at runtime - whenever they're required.  Container creates and disposes of instances of required services - maintaining them for a specific lifetime.

## DI Container Basics
- A container isn't a requirement but simplifies management of dependencies
- Services are registered at start up and resolve at runtime when they are required
- Container creates and disposes of instances while maintaining them for a specific lifetime
- Two primary interfaces for dependency injection in the .NET container
  - IServicesCollection - registers and configures a service
  - IServiceProvider - provides a mechanism for resolving a service at runtime
- Apply dependency via the constructor
- Register all services with the container
- Understand the service lifetimes
 - Scoped
 - Transient
 - Singleton

## Identifying Dependencies to Register in the Container
- First, locate the new keyword usage.
- Is it the instance a dependency?  If a class instantiates another class whose methods are used, it's a dependency.
- Repeat the above approach throughout your app code (there should be code analyzers for this).

## Other Notes
- DI follows the Single Responsibility Principle (SRP) and SOLID principles
- Without DI, apps become excruciatingly difficult to maintain when they grow
- Use constructor injection to accept dependencies
- The Microsoft container will manage creation of the the object graph
- There exist situations for using plain old CLR objects (POCOs) without DI, typically when they are used to contain data and not behavior
- POCOs - plain old CLR objects - are not just defined objects, but class objects in situations where they are used to simply return data and no logic is done and no DI is used when instantiating them, i.e. primitive types and strings
- Value types (structs) cannot be registered with container
- Technically possible to register strings but it is a misuse
- Common requirement for service registration is to provide configuration values, in which case the options pattern will suit much better
- Check out the dependency graph
- Add the configuration to an instance using the following in Program.cs - services.Configure<FeaturesConfiguration>
- Review accessing the Configuration from DI container and what to register with DI container 
- Review the lifetimes on the IServiceCollection
    - Transient - new instance on each any consuming class instance
    - Singleton - same instance for the life of the application, never garbage-collected
    - Scoped - new instance on a request but same in the request lifecycle

|         |Transient|Scoped|Singleton |
|         |:--------------:|:-----------:|:------------:|
|Transient|Yes            |Yes         |Yes|
|Scoped   |No             |Yes         |Yes|
|Singleton|No             |No          |Yes|

## Disposal of Services
- Service container handles disposable types if they implement IAsyncDisposable
- User created instances are not disposed (lifetime managed externally)
- Side-Effects of Captured Dependencies
    - Accidental sharing of non-thread-safe services between threads
    - Objects living longer than their expected lifetime

## Scope Validation
- Scope validation is a good practice while in development.  It should be turned off in production.

```builder.Host.UseDefaultServiceProvider(options => options.ValidateScopes = false);```

- Disabled by default in production (it may have performance implications?)
- Changing the behavior of the scope validation

```builder.Host.UseDefaultServiceProvider(options => options.ValidateScopes = false);```

## Other Recommended Courses

- Using Configuration and Options in .NET Core 3 and ASP.NET Core 3 Apps, by Steve Gordon
- <a href="https://learn.microsoft.com/en-us/dotnet/core/extensions/dependency-injection" target="_blank">Microsoft article</a> on Dependency Injection

## Other Notes
- IServicesCollection (registering/configuring service)
- IServiceProvider (provides a michanism for resolving a service at runtime)
- Identifying dependencies
    - Locate 'new' keyword usage
    - Is it a dependency?
        - Yes if methods are called for the consuming type to function
- Apply dependency via the constructor
- SRP - DI follows the single responsibility principle
- Register all services in the dependency graph
- Use constructor injection to accept dependencies
- The Microsoft container will manage creation of the the object graph
- Situations for using plain old CLR objects (POCOs) without DI
    - POCOs - plain old CLR objects - are not just defined objects, but class objects in situations where they are used to simply return data and no logic is done and no DI is used when instantiating them
- Value types (structs) cannot be registered with container
- Technically possible to register strings but it is a misuse
- Common requirement for service registration is to provide configuration values, in which case the options pattern will suit much better
- Accessing Configuration from the DI Container
- A Pluralsight class - https://app.pluralsight.com/library/courses/dotnet-core-aspnet-core-configuration-options
- Use the options pattern

Once you have the new settings in appsettings.json, such as this:

```json
"Features": {
    "EnableWeatherForecast": false
}
```
You can add the configuration to an instance using the following in ``Program.cs`` using ``services.Configure<FeaturesConfiguration>``

## Disposal of services
- Handles disposable types
- User created instances are not disposed (lifetime managed externally)
- IAsyncDisposable
- Supports async disposal of types

## Side-effects of captured dependencies
- Accidental sharing of non-thread-safe services between threads
- Objects living longer than their expected lifetime
- Inject them as enumerable 





































