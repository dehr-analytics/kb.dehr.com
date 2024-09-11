Title: Dependecy Injection
Published: 01/27/2029
Tags:
    - PowerShell
    - Git
---

namespace:
microsoft.extensions.dependencyInjection


Microsoft.AspNetCore.App

Dependency Injection Container = IoC (Inversion of Control)
mananges instantiation
--//-- invocation of objects

A container isn't a requirement but simplifies management of dependencies

Services are registered at start up, and resolve at runtime - whenever they're required.

Container creatse and disposes of instances of required services - maintining them for a specific lifetime

DI two primary interfaces
IServicesCollection (registering/configuring service)
IServiceProvider (provides a michanism for resolving a service at runtime)
 
Identifying dependencies

Locate 'new' keyword usage
Is it a dependency?
Yes if methods are called for the consuming type to function

Apply dependency via the constructor
REgister the sercvice with the container

Rinse and repeat with other dependencies


Check out the dependency graph.


SRP - single responsibility principle

More difficult to obtain when an application grows

Register all services in the dependency graph
Use constructo r injetion to accept dependencies

The Microsoft container will manage creation of the the object graph

Situtations for using plain old CLR objects (POCOs) without DI

POCOs - plain old CLR objects - are not just defined objects, but class objects in situations where they are used to simply return data and no logic is done and no DI is used when instantiating them

Primitive types and strings

Value types (structs) cannot be registered with container

Technically possible to register strings but it is a misuse

Common requirement for service registration is to provide configuration values, in which case the options pattern will suit much better

Accessing Configuration from the DI Container

A Pluralsight class - https://app.pluralsight/library/courses/dotnet-core-aspnet-core-configuration-options

Using the options pattern

Once you have the new settings in appsettings.json, such as this:

```json
"Features": {
    "EnableWeatherForecas": false
}
```

You can add the configuration to an instance using the following in Program.cs:

services.Configure<FeaturesConfiguration>

Rewatch the Accessing COnfiguration from DI container
and what to register with DI container (first more important)

Registering lifetimes on the IServiceCollection


transient - 
new instance on each any consuming class instance
different between 

singleton - same instance for the life of the application, never garbage-collected
scoped - 
new instance on a request but same in the request lifecycle
lives for the length of the scope of the request

This table shows safe dependencies

|         |Transient|Scoped|Singleton |
|         |:--------------:|:-----------:|:------------:|
|Transient|Yes            |Yes         |Yes|
|Scoped   |No             |Yes         |Yes|
|Singleton|No             |No          |Yes|

Disposal of services

Handles disposable types
User created instances are not disposed (lifetime managed externally)

IAsyncDisposable

Supports async disposal of types

Side-effects of Captured Dependencies
- Accidental sharing of non-thread-safe services between threads
- Objects living longer than their expected lifetime


Scope Validation

Scope validation is a good practice while in development.  It should be turned off in production.

- Disabled by default in production (it may have performance implications?)
- Changing the behavior of the scope validation
- 

builder.Host.UseDefaultServiceProvider(options => options.ValidateScopes = false);

- Inject them as enumerable 





































