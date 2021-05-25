unit WooCommerce4D.Services.HttpClientParams;

interface

uses
  WooCommerce4D.Services.HttpClient,
  RestRequest4D;

type
  THttpClientParams<T : IInterface> = class(TInterfacedObject, iParams<T>)
    private
      [weak]
      FParent : T;
      FReq : IRequest;
    public
      constructor Create(Parent : T; Req : IRequest);
      destructor Destroy; override;
      class function New(Parent : T; Req : IRequest) : iParams<T>;
      function Context(Value : String) : iParams<T>;
      function Page(Value : String) : iParams<T>;
      function PerPage(Value : String) : iParams<T>;
      function Search(Value : String) : iParams<T>;
      function After(Value : String) : iParams<T>;
      function Before(Value : String) : iParams<T>;
      function Exclude(Value : String) : iParams<T>;
      function Include(Value : String) : iParams<T>;
      function Offset(Value : String) : iParams<T>;
      function Order(Value : String) : iParams<T>;
      function OrderBy(Value : String) : iParams<T>;
      function Code(Value : String) : iParams<T>;
      function &End : T;
  end;

implementation

function THttpClientParams<T>.After(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('after', value);
end;

function THttpClientParams<T>.Before(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('before', Value);
end;

function THttpClientParams<T>.Code(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('code', Value);
end;

function THttpClientParams<T>.Context(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('context', Value);
end;

function THttpClientParams<T>.&End: T;
begin
  Result := FParent;
end;

constructor THttpClientParams<T>.Create(Parent : T; Req : IRequest);
begin
  FParent := Parent;
  FReq := Req;
end;

destructor THttpClientParams<T>.Destroy;
begin

  inherited;
end;

function THttpClientParams<T>.Exclude(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('exclude', Value);
end;

function THttpClientParams<T>.Include(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('include', Value);
end;

class function THttpClientParams<T>.New(Parent : T; Req : IRequest) : iParams<T>;
begin
  Result := Self.Create(Parent, Req);
end;

function THttpClientParams<T>.Offset(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('offset', Value);
end;

function THttpClientParams<T>.OrderBy(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('orderby', Value);
end;

function THttpClientParams<T>.Order(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('order', Value);
end;

function THttpClientParams<T>.Page(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('page', Value)
end;

function THttpClientParams<T>.PerPage(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('perpage', Value);
end;

function THttpClientParams<T>.Search(Value: String): iParams<T>;
begin
  Result := Self;
  FReq.AddParam('search', Value);
end;

end.
